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
-- Name: visit; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE visit (
    visit_id character varying(20) NOT NULL,
    visitor_id character varying(20),
    user_login_id character varying(255),
    user_created character(1),
    session_id character varying(255),
    server_ip_address character varying(20),
    server_host_name character varying(255),
    webapp_name character varying(60),
    initial_locale character varying(60),
    initial_request character varying(2000),
    initial_referrer character varying(2000),
    initial_user_agent character varying(255),
    user_agent_id character varying(20),
    client_ip_address character varying(60),
    client_host_name character varying(255),
    client_user character varying(60),
    client_ip_isp_name character varying(60),
    client_ip_postal_code character varying(60),
    cookie character varying(60),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    client_ip_state_prov_geo_id character varying(20),
    client_ip_country_geo_id character varying(20),
    contact_mech_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20)
);


-- ALTER TABLE public.visit OWNER TO ofbiz;

--
-- Name: visit pk_visit; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visit
    ADD CONSTRAINT pk_visit PRIMARY KEY (visit_id);


--
-- Name: visit_thru_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX visit_thru_idx ON visit USING btree (thru_date);


--
-- Name: visit_user_agnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX visit_user_agnt ON visit USING btree (user_agent_id);


--
-- Name: visit_visitor; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX visit_visitor ON visit USING btree (visitor_id);


--
-- Name: visit visit_user_agnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visit
    ADD CONSTRAINT visit_user_agnt FOREIGN KEY (user_agent_id) REFERENCES user_agent(user_agent_id);


--
-- Name: visit visit_visitor; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visit
    ADD CONSTRAINT visit_visitor FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id);


--
-- PostgreSQL database dump complete
--

