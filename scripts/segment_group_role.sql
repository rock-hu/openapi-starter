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
-- Name: segment_group_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE segment_group_role (
    segment_group_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.segment_group_role OWNER TO ofbiz;

--
-- Name: segment_group_role pk_segment_group_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_role
    ADD CONSTRAINT pk_segment_group_role PRIMARY KEY (segment_group_id, party_id, role_type_id);


--
-- Name: sgmt_grp_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmt_grp_rl_txcrts ON segment_group_role USING btree (created_tx_stamp);


--
-- Name: sgmt_grp_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmt_grp_rl_txstmp ON segment_group_role USING btree (last_updated_tx_stamp);


--
-- Name: sgmtgrprl_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrprl_prle ON segment_group_role USING btree (party_id, role_type_id);


--
-- Name: sgmtgrprl_sggp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrprl_sggp ON segment_group_role USING btree (segment_group_id);


--
-- Name: segment_group_role sgmtgrprl_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_role
    ADD CONSTRAINT sgmtgrprl_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: segment_group_role sgmtgrprl_sggp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_role
    ADD CONSTRAINT sgmtgrprl_sggp FOREIGN KEY (segment_group_id) REFERENCES segment_group(segment_group_id);


--
-- PostgreSQL database dump complete
--

