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
-- Name: content_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_assoc (
    content_id character varying(20) NOT NULL,
    content_id_to character varying(20) NOT NULL,
    content_assoc_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    content_assoc_predicate_id character varying(20),
    data_source_id character varying(20),
    sequence_num numeric(20,0),
    map_key character varying(100),
    upper_coordinate numeric(20,0),
    left_coordinate numeric(20,0),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_assoc OWNER TO ofbiz;

--
-- Name: content_assoc pk_content_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT pk_content_assoc PRIMARY KEY (content_id, content_id_to, content_assoc_type_id, from_date);


--
-- Name: cntnt_assc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_assc_txcrts ON content_assoc USING btree (created_tx_stamp);


--
-- Name: cntnt_assc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_assc_txstmp ON content_assoc USING btree (last_updated_tx_stamp);


--
-- Name: contentassc_cbusr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_cbusr ON content_assoc USING btree (created_by_user_login);


--
-- Name: contentassc_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_dtsrc ON content_assoc USING btree (data_source_id);


--
-- Name: contentassc_from; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_from ON content_assoc USING btree (content_id);


--
-- Name: contentassc_lmbur; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_lmbur ON content_assoc USING btree (last_modified_by_user_login);


--
-- Name: contentassc_pred; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_pred ON content_assoc USING btree (content_assoc_predicate_id);


--
-- Name: contentassc_to; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_to ON content_assoc USING btree (content_id_to);


--
-- Name: contentassc_toqry; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_toqry ON content_assoc USING btree (content_id_to, content_assoc_type_id, thru_date);


--
-- Name: contentassc_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentassc_typ ON content_assoc USING btree (content_assoc_type_id);


--
-- Name: content_assoc contentassc_cbusr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_cbusr FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: content_assoc contentassc_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: content_assoc contentassc_from; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_from FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: content_assoc contentassc_lmbur; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_lmbur FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: content_assoc contentassc_pred; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_pred FOREIGN KEY (content_assoc_predicate_id) REFERENCES content_assoc_predicate(content_assoc_predicate_id);


--
-- Name: content_assoc contentassc_to; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_to FOREIGN KEY (content_id_to) REFERENCES content(content_id);


--
-- Name: content_assoc contentassc_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_assoc
    ADD CONSTRAINT contentassc_typ FOREIGN KEY (content_assoc_type_id) REFERENCES content_assoc_type(content_assoc_type_id);


--
-- PostgreSQL database dump complete
--

