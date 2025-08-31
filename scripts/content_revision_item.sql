--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: content_revision_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_revision_item (
    content_id character varying(20) NOT NULL,
    content_revision_seq_id character varying(20) NOT NULL,
    item_content_id character varying(20) NOT NULL,
    old_data_resource_id character varying(20),
    new_data_resource_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_revision_item OWNER TO ofbiz;

--
-- Name: content_revision_item pk_content_revision_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision_item
    ADD CONSTRAINT pk_content_revision_item PRIMARY KEY (content_id, content_revision_seq_id, item_content_id);


--
-- Name: cntntrevit_cntrev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntrevit_cntrev ON content_revision_item USING btree (content_id, content_revision_seq_id);


--
-- Name: cntntrevit_newdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntrevit_newdr ON content_revision_item USING btree (new_data_resource_id);


--
-- Name: cntntrevit_olddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntrevit_olddr ON content_revision_item USING btree (old_data_resource_id);


--
-- Name: cntt_rvn_itm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_rvn_itm_txcrs ON content_revision_item USING btree (created_tx_stamp);


--
-- Name: cntt_rvn_itm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_rvn_itm_txstp ON content_revision_item USING btree (last_updated_tx_stamp);


--
-- Name: content_revision_item cntntrevit_cntrev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision_item
    ADD CONSTRAINT cntntrevit_cntrev FOREIGN KEY (content_id, content_revision_seq_id) REFERENCES content_revision(content_id, content_revision_seq_id);


--
-- Name: content_revision_item cntntrevit_newdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision_item
    ADD CONSTRAINT cntntrevit_newdr FOREIGN KEY (new_data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: content_revision_item cntntrevit_olddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision_item
    ADD CONSTRAINT cntntrevit_olddr FOREIGN KEY (old_data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- PostgreSQL database dump complete
--

